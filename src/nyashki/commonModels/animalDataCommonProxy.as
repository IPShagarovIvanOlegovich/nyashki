package nyashki.commonModels {

import flash.display.Bitmap;

import nyashki.commonCommand.commonCommand;
import nyashki.commonCommand.commonEvents;
import nyashki.commonModels.animalDataCommonProxy;
import nyashki.commonModels.vo.animalDataCommonVO;


public final class animalDataCommonProxy {

    private static var instance:animalDataCommonProxy = new animalDataCommonProxy();

    private var commonComm:commonCommand =  commonCommand.getInstance();

    private var animalCommonVO:Object = animalDataCommonVO.getInstance();


    public function animalDataCommonProxy():void {

        if( instance ) throw new Error( "Singleton and can only be accessed through Singleton.getInstance()" );


        // Добавляем слушалку запроса на загрузку большого фото юзера в модель
        commonComm.addEventListener(commonEvents.LOADUSERBIGPHOTO, getUserPhotoResource);

        // Добавляем слушалку запроса на загрузку картинки в модель
        commonComm.addEventListener(commonEvents.LOADANIMALPIC, getAnimalPictureResource);

        // Добавляем слушалку запроса на загрузку списка сабнейлов и параметров в модель
        commonComm.addEventListener(commonEvents.LOADANIMALLISTTOSELECT, getAnimalListToSelect);

    }


    // Достаем из модели массив имен няшек с параметрами для начального выбора и возвращаем по требованию
    public function get animalNames():Object {

        return animalCommonVO.animalNamesWithParams;

    }


    // Пихаем в модель ресурс няшки подгруженный динамически
    public function set animalFileToLoad(fileName:String):void {

        animalCommonVO.animalFileToLoad = fileName;

    }

    // Достаем из модели ресурс няшки и возвращаем по требованию
    public function get animalFileToLoad():String {

        return animalCommonVO.animalFileToLoad;

    }

    // Пихаем в модель ресурс няшки подгруженный динамически
    public function set faceResource(fileName:Bitmap):void {

        animalCommonVO.faceResource = fileName;



    }

    // Достаем из модели ресурс няшки и возвращаем по требованию
    public function get faceResource():Bitmap {

        return animalCommonVO.faceResource;

    }


    // Достаем из модели и возвращаем по требованию
    public function get animalPictureRes():Object {

        return animalCommonVO.image;

    }

    public static function getInstance():animalDataCommonProxy {

        return instance;

    }


    // Достаем из модели и возвращаем по требованию
    public function get currentAnimal():String {

        return animalCommonVO.currentAnimal;

    }

    // Пихаем в модель
    public function set genDialogLocked(lock:Boolean):void {

        animalCommonVO.genDialogLock = lock;

    }

    // Достаем из модели и возвращаем по требованию
    public function get genDialogLocked():Boolean {

        return animalCommonVO.genDialogLock;

    }

    // Пихаем в модель
    public function set currentAnimal(fileName:String):void {

        animalCommonVO.currentAnimal = fileName;

    }



    // Достаем из модели и возвращаем по требованию
    public function get currentToolTip():Array {

        return animalCommonVO.currentToolTip;

    }

    // Пихаем в модель
    public function set currentToolTip(ToolTipName:Array):void {

        animalCommonVO.currentToolTip = ToolTipName;

    }


    // Достаем из модели и возвращаем по требованию
    public function get currentAnimalWithParams():Object {

        return animalCommonVO.currentAnimalWithParams;

    }

    // Пихаем в модель
    public function set currentAnimalWithParams(fileName:Object):void {

        animalCommonVO.currentAnimalWithParams = fileName;

    }



}
}
