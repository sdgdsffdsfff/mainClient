package com.cjx.event
{
	import flash.events.Event;
	
	public class MyDataEvent extends Event
	{
		public var data:Object;
		
		public function MyDataEvent(type:String, data:Object, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
			this.data = data;
		}
	}
}