package com.cjx.mvc.model
{
	import com.cjx.manager.ModulesManager;
	
	import flash.display.DisplayObject;
	import flash.display.LoaderInfo;
	import flash.events.Event;
	import flash.events.IOErrorEvent;
	import flash.events.ProgressEvent;
	import flash.net.URLRequest;
	
	import mx.controls.SWFLoader;
	import mx.core.UIComponent;
	import mx.events.ModuleEvent;
	import mx.modules.ModuleLoader;
	
	import org.puremvc.as3.interfaces.IProxy;
	import org.puremvc.as3.patterns.proxy.Proxy;
	
	public class ModuleLoaderProxy extends Proxy implements IProxy
	{
		public static const NAME:String = "ModuleLoaderProxy";
		
		public static const MODULE_LOAD_SUCCESS:String = "moduleLoadSuccess";
		public static const MODULE_LOAD_FAILED:String = "moduleLoadFailed";
		
		public var loading:Boolean = false;
		
		public function ModuleLoaderProxy(data:Object=null)
		{
			super(NAME, data);
		}
		
		/**
		 * 加载模块
		 * 
		 * */
		public function loadModule(url:String):void
		{
			var moduleLoader:SWFLoader = new SWFLoader();
			moduleLoader.addEventListener(Event.COMPLETE,readyHandler);
			moduleLoader.addEventListener(IOErrorEvent.IO_ERROR,errorHandler);
			moduleLoader.addEventListener(ProgressEvent.PROGRESS,progressHandler);
			
			moduleLoader.load(url);
			loading = true;
		}
		
		private function readyHandler(e:Event):void
		{
			var moduleLoader:SWFLoader = e.target as SWFLoader;
			moduleLoader.removeEventListener(Event.COMPLETE,readyHandler);
			moduleLoader.removeEventListener(IOErrorEvent.IO_ERROR,errorHandler);
			moduleLoader.removeEventListener(ProgressEvent.PROGRESS,progressHandler);
			
			var ui:UIComponent = moduleLoader.content as UIComponent;
			var url:String = moduleLoader.source as String;
			sendNotification(MODULE_LOAD_SUCCESS,ui);
			ModulesManager.getInstance().addModule(url.substring(0,url.indexOf("?v=")),ui);
			loading = false;
		}
		private function errorHandler(e:Event):void
		{
			var moduleLoader:SWFLoader = e.target as SWFLoader;
			moduleLoader.removeEventListener(Event.COMPLETE,readyHandler);
			moduleLoader.removeEventListener(IOErrorEvent.IO_ERROR,errorHandler);
			moduleLoader.removeEventListener(ProgressEvent.PROGRESS,progressHandler);
			
			sendNotification(MODULE_LOAD_FAILED,e.toString());
			loading = false;
		}
		private function progressHandler(e:Event):void
		{
			//trace(e.toString());
		}
		
	}
}