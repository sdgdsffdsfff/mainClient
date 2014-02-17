package assets
{
	
	/**
	 * 作为应用程序的一个配置文件，配置一些静态常量等信息
	 * 
	 * */
	public class AppConfig
	{
		
		public function AppConfig()
		{
		}
		
		/**
		 * 设置缓存的最大模块数
		 * */
		public static const MAX_MODULE_NUM:int = 10;
		
		/**
		 * 主界面上方各按钮的name配置，利用toggleButton的name属性存放各模块的路径
		 * 值必须为各模块swf路径
		 * */
		public static const INDICATOR:String = "IndicatorModule";	//指标统计按钮
		public static const CLUSTERANALYSIS:String = "ClusterAnalysisModule";	//聚类分析按钮
		public static const PATENTSEARCH:String = "PatentSearchModule";//专利查询
		
		
	}
}