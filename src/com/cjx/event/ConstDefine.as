package com.cjx.event
{
	public class ConstDefine
	{
		
		/**	
		 * 指标类型	
		 * */
		public static const PATENT_GROWTH_RATE:int = 1;	//专利增长率
		public static const TECHNICAL_GROWTH_RATE:int = 10001;	//技术生长率
		public static const MATURE_TECHNOLOGY_COEFFICIENT:int = 10002;	//技术成熟系数
		public static const TECHNOLOGY_AGING_COFFICIENT:int = 4;	//技术衰老系数
		
		
		/**	
		 * 聚类分析	
		 * */
		public static const ClusterAnalysis:int = 20001;	//聚类分析
		public static const ClusterItemSearch:int = 20002;//聚类专利查询
		public static const ClusterSearchResult:int = 20003;	//聚类分析查询，所有结果专利
		
		/**	
		 * 专利查询
		 * */
		public static const PatentSearch:int = 30001;	//专利查询
		
		
		public function ConstDefine()
		{
		}
	}
}