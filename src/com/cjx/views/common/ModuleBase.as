package com.cjx.views.common
{
	import flash.events.Event;
	import flash.events.MouseEvent;
	
	import mx.core.IVisualElement;
	import mx.core.IVisualElementContainer;
	import mx.core.UIComponent;
	
	import spark.components.Group;
	import spark.components.Panel;
	
	/**
	 * 所有模块的基类，设置模块的共同特性
	 * 
	 * @author cjx;
	 * 
	 * */
	public class ModuleBase extends Group
	{
		private var bg:Panel;
		
		public function ModuleBase()
		{
			super();
			
			this.addEventListener(MouseEvent.CLICK,clickHandler);
			this.addEventListener(Event.ADDED_TO_STAGE,addedToStageHandler);
			
			bg = new Panel();
			bg.setStyle("cornerRadius",0);
			bg.setStyle("fontSize",12);
			bg.addEventListener(MouseEvent.MOUSE_DOWN,startDragHandler);
			bg.addEventListener(MouseEvent.MOUSE_UP,stopDragHandler);
			
		}
		
		private function addedToStageHandler(e:Event):void
		{
			this.addElementAt(bg,0);
		}
		
		private function startDragHandler(e:MouseEvent):void
		{
			clickHandler();
			this.startDrag();
		}
		private function stopDragHandler(e:MouseEvent):void
		{
			this.stopDrag();
		}
		
		/**
		 * 设置模块标题
		 * 
		 * */
		public function set title(title:String):void
		{
			bg.title = title;
		}
		
		/**
		 * 点击时，将其放到顶层
		 * */
		private function clickHandler(e:MouseEvent = null):void
		{
			if(this.parent && this.parent is IVisualElementContainer)
			{
				(this.parent as IVisualElementContainer).setElementIndex(this,this.parent.numChildren-1);
			}
		}
		
		/**
		 * 设为可见时，将其放到顶层
		 * */
		override public function set visible(value:Boolean):void
		{
			super.visible = value;
			
			if(value)
			{
				//模拟点击事件
				clickHandler();
			}
		}
		
		override public function set width(value:Number):void
		{
			super.width = value;
			
			bg.width = value;
		}
		override public function set height(value:Number):void
		{
			super.height = value;
			
			bg.height = value;
		}
		
	}
}