package
{

import flash.display.DisplayObject;
import flash.display.StageAlign;
import flash.display.StageQuality;
import flash.display.StageScaleMode;
import flash.events.Event;
import flash.system.Security;
import nyashki.ApplicationFacade;
import nyashki.commonCommand.commonCommand;
import nyashki.commonCommand.commonEvents;
import nyashki.commonCommand.okCommand;

[SWF(width="760", height="475", frameRate="60", pageTitle="", backgroundColor="0xFFFFFF")]

public class nyashki extends Sprite {

    private static var _instance:nyashki;
    private static  var okComm:okCommand = okCommand.getInstance();
    private static var commonComm:commonCommand = commonCommand.getInstance();
    public var FLASH_VARS_EXT:Object = {};
    public var FLASH_URL_EXT:String = "";
    private var appFacade:DisplayObject;

    public function nyashki()
    {
        // Добавляем ивент для предзагрузчика
        addEventListener(Event.ADDED_TO_STAGE, _onAddedToStage);

}

    private function _onAddedToStage(event:Event):void {
        removeEventListener(Event.ADDED_TO_STAGE, _onAddedToStage);
        stage.align = StageAlign.TOP_LEFT;
        stage.quality = StageQuality.BEST;
        stage.scaleMode = StageScaleMode.NO_SCALE;
    }

    public static function get instance():nyashki {
        return _instance;
    }


    override public function initialize():void {

        addChild(new nBackground(contentWidth, contentHeight));
		loadInterface();

    }



    private function loadInterface():void {

        // Фасад со всеми элементами
        appFacade = new ApplicationFacade() as DisplayObject;
        addChild(appFacade);
        this.dispatchEvent(new Event(Event.COMPLETE));

    }

}
}
