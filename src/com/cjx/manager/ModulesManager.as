package com.cjx.manager
{
	import assets.AppConfig;
	
	import flash.utils.Dictionary;
	
	import mx.collections.ArrayList;
	import mx.core.UIComponent;

	/**
	 * 单例
	 * 模块管理类，保证缓存的最大模块数量不大于设定值
	 * 
	 * */
	public class ModulesManager
	{
		private static var _instance:ModulesManager = null;
		
		private var moduleDic:Dictionary = new Dictionary();
		public var moduleCount:int = 0;
		
		public function ModulesManager()
		{
		}
		
		public static function getInstance():ModulesManager
		{
			if(!_instance)
			{
				_instance = new ModulesManager();
			}
			return _instance;
		}
		
		/**
		 * 增加模块，并将最早加入且当前不显示的模块卸载
		 * 
		 * */
		public function addModule(name:String,module:UIComponent):void
		{
			if(moduleCount > AppConfig.MAX_MODULE_NUM)
			{
				var ui:UIComponent;
				for each(var key:String in moduleDic)
				{
					ui = moduleDic[key] as UIComponent;
					if(ui && !ui.visible)
					{
						if(ui.parent)
						{
							ui.parent.removeChild(ui);
						}
						delete moduleDic[key];
						moduleCount--;
					}
				}
			}
			
			moduleDic[name] = module;
			moduleCount++;
		}
		
		/**
		 * 根据模块URL获取模块，若不存在，返回null
		 * 
		 * */
		public function getModule(name:String):UIComponent
		{
			if(moduleDic[name])
			{
				return moduleDic[name] as UIComponent;
			}
			return null;
		}
		
		/**
		 * 检测是否包含某模块
		 * 
		 * */
		public function isModuleLoaded(url:String):Boolean
		{
			if(moduleDic[url])
			{
				return true;
			}
			return false;
		}
		
		
	}
}