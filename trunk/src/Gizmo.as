package {

	import com.shivolve.histogram.controller.*;
	import com.shivolve.histogram.model.*;
	import com.shivolve.histogram.views.*;
	
	import com.adobe.viewsource.ViewSource;
	
	import flash.display.Sprite;
	import flash.events.*;
	import flash.text.TextField;
	import flash.text.TextFormat;
	
	import flash.text.TextField;

	public class Gizmo extends Sprite {

		private var controller:GizmoController;
		private var gridView:GizmoGridView;
		private var chartView:GizmoChartView;
		private var inst_txt:TextField;
		private var txtBtn:TextField;

		public function Gizmo():void {
			
			ViewSource.addMenuItem(this, "srcview/index.html");

			controller = new GizmoController();
			controller.setDataProvider();
			gridView = new GizmoGridView(this, controller);
			addChild(gridView);
			chartView = new GizmoChartView(this, controller);
			addChild(chartView);
			createButton();
			createInstructionTxt();
			addEventListeners();
		}
		private function createInstructionTxt():void {
			inst_txt = new TextField();
			var tf:TextFormat;
			tf = new TextFormat();
			tf.font = "Arial";
			tf.size = 12;
			var inst_txt:TextField = new TextField();
			inst_txt.text = "Click on an empty cell to add the circle.";
			inst_txt.x = 50;
			inst_txt.y = 0;
			inst_txt.width = 420;
			inst_txt.height = 25;
			inst_txt.setTextFormat(tf);
			inst_txt.selectable = false;
			addChild(inst_txt);
		}
		private function createButton():void {
			txtBtn = new TextField();
			var tf:TextFormat;
			tf = new TextFormat();
			tf.font = "Arial";
			tf.size = 12;
			txtBtn.text = "Click here to Create New Gizmo";
			txtBtn.selectable = false;
			txtBtn.x = 50;
			txtBtn.y = 175;
			txtBtn.width = 300;
			txtBtn.setTextFormat(tf);
			addChild(txtBtn);
		}
		private function addEventListeners():void {
			txtBtn.addEventListener(MouseEvent.MOUSE_UP, mouseUpHandler);
		}
		public function mouseUpHandler(e:MouseEvent):void {
			controller.setDataProvider();
			gridView = new GizmoGridView(this, controller);
			addChild(gridView);
			chartView = new GizmoChartView(this, controller);
			addChild(chartView);
		}
		
	}
}