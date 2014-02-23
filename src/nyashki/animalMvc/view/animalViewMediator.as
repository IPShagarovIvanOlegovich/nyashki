/**
 * Created by Ivan Shagarov
 * Orel city
 * Date: 24.11.13
 * Time: 18:19
 */
package nyashki.animalMvc.view {


import components.buttons.ToolTipMaster.ToolTip;
import flash.display.Sprite;
import flash.events.Event;
import flash.events.MouseEvent;
import flash.media.Sound;
import flash.utils.clearInterval;
import flash.utils.setInterval;

import nyashki.animalMvc.controller.animalCommand;
import nyashki.animalMvc.controller.animalEvents;
import nyashki.animalMvc.model.animalDataProxy;

import nyashki.animalMvc.view.component.animalView;
import nyashki.commonCommand.commonCommand;
import nyashki.commonCommand.commonEvents;
import nyashki.commonModels.animalDataCommonProxy;
import nyashki.commonModels.vo.animalDataCommonVO;

public final class animalViewMediator extends Sprite{

    private static var instance:animalViewMediator = new animalViewMediator();

    private var animalComm:animalCommand = animalCommand.getInstance();
    private var animalDProxy:animalDataProxy = animalDataProxy.getInstance();
    private var animalViewIns:animalView = animalView.getInstance();

    private var animalCommonVO:Object = animalDataCommonVO.getInstance();

    private var commonComm:commonCommand = commonCommand.getInstance();
    private var animalDCommonProxy:animalDataCommonProxy = animalDataCommonProxy.getInstance();
    private var animalContButt:PhotoClean;
    private var faceContButt:PhotoClean;

    private var hiSound:Sound = new Resources.hi() as Sound;
    private var hi2Sound:Sound = new Resources.hi2() as Sound;
    private var nyaSound:Sound = new Resources.nya() as Sound;
    private var pikSound:Sound = new Resources.pik() as Sound;
    private var dimaSound:Sound = new Resources.dima() as Sound;
    private var iiiSound:Sound = new Resources.iii() as Sound;
    private var pukSound:Sound = new Resources.puk() as Sound;
    private var uuuSound:Sound = new Resources.uuu() as Sound;

    private var eventOwner:String = "";
    private var oneTimeCall:Boolean = false;
    private var delay:uint;
    private var showTip:Function;


    private var toolTip:ToolTip = new ToolTip();

    public function animalViewMediator():void {
       // super(Constants.ANIMAL_WIDTH, Constants.ANIMAL_HEIGHT, false);

        if( instance ) throw new Error( "Singleton and can only be accessed through Singleton.getInstance()" );

    }

    public function showAnimal():void {

        animalContButt = animalViewIns.showAnimal(animalDCommonProxy.animalFileToLoad) as PhotoClean;
        animalContButt.imageContainer.addEventListener(MouseEvent.CLICK, animalContButt_click);
        //animalContButt.useHandCursor = true;
        addChild(animalContButt);

        // Шлем команду в команду на загрузку картинки
        commonComm.dispatchEvent(new commonEvents(commonEvents.LOADANIMALPIC));

        // Добавляем слушалку прихода картинки в модель
        commonComm.addEventListener(commonEvents.ANIMALPICLOADED, ANIMALPICLOADED_handler);

        // Ждем пока загрузится картинка, т.е. вызова функции добавления картинки от команды

    }

    // Вызывается с уже пришедшим ресурсом из базы или редактора
    public function showFace():void {

        // Парсим имена и параметры для добавления квадрата лица из параметров
        for each (var option:Object in animalDCommonProxy.animalNames){

            // Если имя из массива параметров совпало с текущим няшкой - взять его параметры квадрата для наложения на фотку
            if(option.name == animalDCommonProxy.animalFileToLoad){

                // Добавление лица в няшку
                faceContButt = animalViewIns.showFace(option);

                // Записываем в модель имя и параметры текущего анимала для других манипуляций
                animalDCommonProxy.currentAnimalWithParams =  option;

            }

        }

        //faceContButt.addEventListener(MouseEvent.CLICK, animalContButt_click);

        addChildAt(faceContButt,0);

    }

    public function removeFace():void {

        this.removeChild(faceContButt);

    }

    public function removeAnimal():void {

        this.removeChild(animalContButt);

    }

    // Пихаем в модель
    public function set oneTimeCallSet(value:Boolean):void {

        this.oneTimeCall = value;

    }

    // Пихаем в модель
    public function set EventOwner(value:String):void {

        this.eventOwner = value;

    }

    public function get EventOwner():String {

       return this.eventOwner;

    }


    public function addDelayHintToFace(_title:String = "", _message:String = "", _dBottomOffset:int = 100):void {


        animalContButt.imageContainer.removeEventListener(MouseEvent.CLICK, animalContButt_click);

        toolTip.setDefault();
        toolTip.align = "bottomcenter";
        toolTip.tipWidth = 270;
        toolTip.autoSize = false;
        toolTip.titleEmbed = false;
        toolTip.noMouse = true;
        toolTip.stableX = faceContButt.x - 80;
        toolTip.stableY = faceContButt.height - 10;


        // _dBottomOffset - не играет роли когда указаны стабильные координаты!
        //toolTip.bottomOffset = _dBottomOffset;


        showTip = function():void {
            toolTip.show( faceContButt ,"<h1>"+_title+"</h1>", "<p class='body'>"+_message+"</p>" );
        }

        delay = setInterval(startDelayAction, 8000);

        stage.addEventListener(MouseEvent.MOUSE_UP, showTip);
        stage.dispatchEvent(new MouseEvent (MouseEvent.MOUSE_UP));
        stage.addEventListener(MouseEvent.MOUSE_DOWN, hideTipByClick);

    }


    private function hideTipByClick(event:MouseEvent):void {

        hideTip();
    }

    private function startDelayAction():void {

        hideTip();

    }

    private function hideTip():void {

        stage.removeEventListener(MouseEvent.MOUSE_UP, showTip);
        stage.removeEventListener(MouseEvent.MOUSE_DOWN, hideTipByClick);
        toolTip.hide();
        clearInterval(delay);

        // Опытным путем установил что событие ЖИВЕТ около 500 милисекунд (80 тысячных) поэтому если добавить лиснер сразу - он сработает т.е. словит прошедшее событие, поэтому задержим его
        var delay1:uint = setInterval(delayAddLisner, 800);

        function delayAddLisner():void {

            // При закрытии тултипа - посылаем всем уведомление об этом если это не локальный вызов
           if(!oneTimeCall){

               if(eventOwner == ""){

                   commonComm.dispatchEvent(new commonEvents(commonEvents.FACEADDDELAYHINTCLOSED));

               }

               if(eventOwner == "FACEADDDELAYHINTMOOD"){

                   commonComm.dispatchEvent(new commonEvents(commonEvents[eventOwner + 'CLOSED']));

               }

               if(eventOwner == "FACEADDDELAYHINTLEFTMENU"){

                   commonComm.dispatchEvent(new commonEvents(commonEvents[eventOwner + 'CLOSED']));

               }

           }


            if(oneTimeCall){

                animalDCommonProxy.genDialogLocked = false;

            }


            if(eventOwner == ""){

                commonComm.dispatchEvent(new commonEvents(commonEvents.FACADEFACEADDDELAYHINTCLOSED));

            }

            if(eventOwner == "FACEADDDELAYHINTMOOD"){

                commonComm.dispatchEvent(new commonEvents(commonEvents['FACADE' + eventOwner + 'CLOSED']));

            }

            if(eventOwner == "FACEADDDELAYHINTLEFTMENU"){

                commonComm.dispatchEvent(new commonEvents(commonEvents['FACADE' + eventOwner + 'CLOSED']));

            }

            eventOwner = "";


            // Возвращаем назад слушалку клика по няшке
            animalContButt.imageContainer.addEventListener(MouseEvent.CLICK, animalContButt_click);

            clearInterval(delay1);

            // Возвращаем триггер одноразового вызова в дефолтное состояние
            oneTimeCall = false;
        }
    }

    // Обязательно добавлять параметр к хэндлерам!
    public function ANIMALPICLOADED_handler(event:commonEvents):void {

        animalViewIns.animalPicAddToCont(animalDCommonProxy.animalPictureRes);

    }

    private function animalContButt_click(event:MouseEvent):void {

       var checkObj:Array = new Array();

        oneTimeCall = true;

        checkObj = animalComm.checkLowParamsGetActions(animalDCommonProxy.currentAnimalWithParams);

        // Добавить генерацию тултипа с подсказкой
        animalDCommonProxy.currentToolTip[0] = "Привет :-)";
        animalDCommonProxy.currentToolTip[1] = checkObj.result.tip;
        animalDCommonProxy.currentToolTip[2] = checkObj.result.tipHeight;
        animalDCommonProxy.currentToolTip[3] = true; // Положит или отрицат
        animalDCommonProxy.currentToolTip[4] = true; // Генерить случайное событие после этого хинта или нет  true значит нет
        commonComm.dispatchEvent(new commonEvents(commonEvents.FACEADDDELAYHINT));

        //playRandTrueSound();

    }

    public function playRandFalseSound():void {

        if(!animalCommonVO.soundEnable){

            var randint:Number = Math.random();
            switch(true){
                case (randint > Number(0.8)): {
                    dimaSound.play();
                    break;
                }
                case (randint > Number(0.6)): {
                    iiiSound.play();
                    break;
                }
                case (randint > Number(0.3)): {
                    pukSound.play();
                    break;
                }
                case (randint > Number(0)): {
                    uuuSound.play();
                    break;
                }
            }
        }
    }

    public function playRandTrueSound():void {

        if(!animalCommonVO.soundEnable){

            var randint:Number = Math.random();
            switch(true){
                case (randint > Number(0.8)): {
                    hiSound.play();
                    break;
                }
                case (randint > Number(0.6)): {
                    hi2Sound.play();
                    break;
                }
                case (randint > Number(0.3)): {
                    nyaSound.play();
                    break;
                }
                case (randint > Number(0)): {
                    pikSound.play();
                    break;
                }
            }
        }
    }


    public static function getInstance():animalViewMediator {

        return instance;

    }
}
}
