package com.cjx.net
{
	import mx.rpc.events.FaultEvent;
	import mx.rpc.events.ResultEvent;
	import mx.rpc.remoting.Operation;
	import mx.rpc.remoting.mxml.RemoteObject;

	/**
	 * 单例模式，管理RemoteObject，与服务器进行通信
	 * 
	 * @author cjx
	 * */
	public class RemoteObjectManager
	{
		private static var _instance:RemoteObjectManager = null;
		
		public var remoteObject:RemoteObject;
		
		public function RemoteObjectManager()
		{
			//对应服务端的CommandAdaptor类，用于接收客户端指令
			remoteObject = new RemoteObject("commandAdaptor");
			
			remoteObject.addEventListener(ResultEvent.RESULT,resultHandler);
			remoteObject.addEventListener(FaultEvent.FAULT,faultHandler);
		}
		
		public static function getInstance():RemoteObjectManager
		{
			if(!_instance)
			{
				_instance = new RemoteObjectManager();
			}
			return _instance;
		}
		
		/**
		 * 执行向服务器发送指令跟参数
		 * 
		 * */
		public function doCommand(command:int,value:Object):void
		{
			var operation:Operation = remoteObject.getOperation("doCommand") as Operation;
			operation.send(command,value);
		}
		
		private function resultHandler(e:ResultEvent):void
		{
			trace(e.toString());
		}
		private function faultHandler(e:FaultEvent):void
		{
			trace(e.toString());
		}
	}
}