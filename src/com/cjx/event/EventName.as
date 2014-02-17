package com.cjx.event
{
	/**
	 * 将所有事件名称写在此类下
	 * 
	 * */
	public class EventName
	{
		//主界面上方按钮点击事件
		public static const MAINCONTAINER_BUTTONCLICK:String = "mainContainerButtonClick";
		
		/**
		 * 指标模块
		 * 
		 * */
		public static const INDICATOR_SUBMIT:String = "指标模块查询请求";
		
		
		/**
		 * 聚类模块
		 * 
		 * */
		public static const CLUSTER_SUBMIT:String = "聚类模块查询请求";
		public static const CLUSTER_ITEM_DOUBLECLICK:String = "聚类条目双击";
		
		/**
		 * 专利查询
		 * */
		public static const PATTEN_SEARCH:String = "专利查询请求";
		
		public static const PATENT_INFOPANEL_HIDE:String = "隐藏专利信息界面";
		
		
		public function EventName()
		{
		}
	}
}