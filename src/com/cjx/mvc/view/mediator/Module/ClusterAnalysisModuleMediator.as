package com.cjx.mvc.view.mediator.Module
{
	import com.cjx.event.ConstDefine;
	import com.cjx.event.EventName;
	import com.cjx.event.MyDataEvent;
	import com.cjx.mvc.model.MessageProxy;
	import com.cjx.net.RemoteObjectManager;
	import com.cjx.views.modules.clusterAnalysis.ClusterAnalysisModule;
	
	import mx.collections.ArrayCollection;
	
	import org.puremvc.as3.interfaces.IMediator;
	import org.puremvc.as3.interfaces.INotification;
	import org.puremvc.as3.patterns.mediator.Mediator;
	
	/**
	 * 聚类分析模块的view层
	 * 
	 * @author cjx;
	 * */
	public class ClusterAnalysisModuleMediator extends Mediator implements IMediator
	{
		public static const NAME:String = "ClusterAnalysisMediator";
		
		public var clusterAllPatentSearchResult:ArrayCollection;
		
		public function ClusterAnalysisModuleMediator(viewComponent:ClusterAnalysisModule)
		{
			super(NAME, viewComponent);
			
			viewComponent.addEventListener(EventName.CLUSTER_SUBMIT,onClusterSubmit);
			viewComponent.addEventListener(EventName.CLUSTER_ITEM_DOUBLECLICK,onItemDoubleClick);
		}
		
		private function onClusterSubmit(e:MyDataEvent):void
		{
			RemoteObjectManager.getInstance().doCommand(ConstDefine.ClusterAnalysis,e.data);
		}
		
		private function onItemDoubleClick(e:MyDataEvent):void
		{
			var pttClass:String = getPttClassByInt(e.data["pttClass"]);
			var cluster:String = (String)((e.data["cluster"] as int)-1);
			var dataprovider:ArrayCollection = new ArrayCollection();
			if(clusterAllPatentSearchResult)
			{
				for each(var obj:Object in clusterAllPatentSearchResult)
				{
					if(obj["classNumG06q"] == pttClass && obj["cluster"] == cluster)
					{
						dataprovider.addItem(obj);
					}
				}
			}
			view.clusterChart.resultList.dataProvider = dataprovider;
			view.clusterChart.resultList.x = view.clusterChart.mouseX;
			view.clusterChart.resultList.y = view.clusterChart.mouseY - 100;
			view.clusterChart.resultList.visible = true;
		}
		
		override public function listNotificationInterests():Array
		{
			return [
				MessageProxy.ClusterAnalysisDataReceive,
				MessageProxy.ClusterPatentsResultReceive,
				MessageProxy.ClusterAllPatentsResultReceive
			];
		}
		
		override public function handleNotification(notification:INotification):void
		{
			switch(notification.getName())
			{
				case MessageProxy.ClusterAnalysisDataReceive:
					view.clusterChart.chartDataprovider = notification.getBody() as ArrayCollection;
					break;
				case MessageProxy.ClusterPatentsResultReceive:
					view.clusterChart.resultList.dataProvider = notification.getBody() as ArrayCollection;
					break;
				case MessageProxy.ClusterAllPatentsResultReceive:
					clusterAllPatentSearchResult = notification.getBody() as ArrayCollection;
					break;
			}
		}
		
		public function get view():ClusterAnalysisModule
		{
			return viewComponent as ClusterAnalysisModule;
		}
		
		public function getPttClassByInt(i:int):String
		{
			switch(i)
			{
				case 1:
					return "G06Q10/00";
				case 2:
					return "G06Q20/00";
				case 3:
					return "G06Q30/00";
				case 4:
					return "G06Q40/00";
				case 5:
					return "G06Q50/00";
				case 6:
					return "G06Q90/00";
				case 7:
					return "G06Q99/00";
			}
			return "";
		}
	}
}