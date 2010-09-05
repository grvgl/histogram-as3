package com.shivolve.histogram.model{
	public class DataObj{
		
		private var _rowIndex: Number;
		private var _columnValue: Number;
		
		public function DataObj(i:Number, v:Number) {
			_rowIndex = i;
			_columnValue = v;
		}
		public function set rowIndex(i:Number):void{
			_rowIndex = i;
		}
		public function get rowIndex():Number{
			return _rowIndex;
		}
		public function set columnValue(v:Number):void{
			_columnValue = v;
		}
		public function get columnValue():Number{
			return _columnValue;
		}		
	}
}