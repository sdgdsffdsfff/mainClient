package com.cjx.net
{
	import flash.utils.Dictionary;
	
	import mx.collections.ArrayCollection;
	import mx.collections.ArrayList;

	public class OperationManager
	{
		public static var _instance:OperationManager = null;
		
		public function OperationManager()
		{
		}
		
		public static function getInstance():OperationManager
		{
			if(!_instance)
			{
				_instance = new OperationManager();
			}
			return _instance;
		}
		
		
	}
}