package com.cjx.mvc.model
{
	import com.cjx.event.ConstDefine;
	
	import mx.collections.ArrayCollection;
	import mx.collections.Sort;
	import mx.collections.SortField;
	import mx.messaging.ChannelSet;
	import mx.messaging.Consumer;
	import mx.messaging.channels.AMFChannel;
	import mx.messaging.events.MessageEvent;
	
	import org.puremvc.as3.interfaces.IProxy;
	import org.puremvc.as3.patterns.proxy.Proxy;
	
	public class MessageProxy extends Proxy implements IProxy
	{
		public static const TECHNICAL_GROWTH_RATE_RECEIVE:String = "收到技术生长率数据";
		public static const ClusterAnalysisDataReceive:String = "收到聚类分析数据";
		public static const PatentSearchResultReceive:String = "收到专利查询结果";
		public static const ClusterAllPatentsResultReceive:String = "收到聚类分析查询所有专利结果";
		public static const ClusterPatentsResultReceive:String = "收到聚类item双击查询返回数据";
		
		public var consumer:Consumer = new Consumer();
		
		public function MessageProxy(proxyName:String=null, data:Object=null)
		{
			super(proxyName, data);
			
			var url:String = "http://localhost:8080/patentOLAM/";	//可弄成配置文件，方便修改
			var amfchannel:AMFChannel = new AMFChannel(url + "my-amf",url + "messagebroker/amf");
			amfchannel.pollingEnabled = true;
			amfchannel.pollingInterval = 1000;
			var channelSet:ChannelSet = new ChannelSet();
			channelSet.addChannel(amfchannel);
			
			consumer = new Consumer();
			consumer.destination = "myDataMsg";
			consumer.addEventListener(MessageEvent.MESSAGE,handleResponse);
			consumer.channelSet = channelSet;
			consumer.subscribe();
		}
		
		public function handleResponse(e:MessageEvent):void
		{
			switch(e.messageId)
			{
				case String(ConstDefine.MATURE_TECHNOLOGY_COEFFICIENT):
				case String(ConstDefine.TECHNICAL_GROWTH_RATE):
					var dp:ArrayCollection = new  ArrayCollection();
					var obj:Object;
					for each(obj in (e.message.body["value11"] as ArrayCollection))
					{
						var o:Object = new Object();
						o.year = obj.year;
						o.type11Value = obj.value;
						dp.addItem(o);
					}
					sendNotification(TECHNICAL_GROWTH_RATE_RECEIVE,dp);
					break;
				
				case String(ConstDefine.ClusterAnalysis):
					var clusterData:ArrayCollection = e.message.body["dataprovider"] as ArrayCollection;
					sendNotification(ClusterAnalysisDataReceive,clusterData);
					break;
				
				case String(ConstDefine.PatentSearch):
					var patentsResult:ArrayCollection = e.message.body as ArrayCollection;
					sendNotification(PatentSearchResultReceive,patentsResult);
					break;
				
				case String(ConstDefine.ClusterSearchResult):
					var pttrs:ArrayCollection = e.message.body as ArrayCollection;
					sendNotification(ClusterAllPatentsResultReceive,pttrs);
					break;
			}
		}
	}
	
}