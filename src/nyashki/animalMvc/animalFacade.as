/**
 * Created by Ivan Shagarov
 * Orel city
 * Date: 24.11.13
 * Time: 18:32
 */
package nyashki.animalMvc {

import flash.display.Bitmap;
import flash.display.BitmapData;
import flash.display.Sprite;

import nyashki.animalMvc.controller.animalCommand;
import nyashki.animalMvc.model.animalDataProxy;
import nyashki.animalMvc.view.animalViewMediator;
import nyashki.commonCommand.commonCommand;
import nyashki.commonCommand.commonEvents;
import nyashki.commonModels.animalDataCommonProxy;
import nyashki.commonModels.vo.okDataCommonVO;


public final class animalFacade {

    private static var instance:animalFacade = new animalFacade();


    // Добавляем инит прокси для данных, медиатор для вьюх и команду  - ИМЯ ПЕРЕМЕННОЙ ОБЯЗАТЕЛЬНО ДОЛЖНО БЫТЬ ОТЛИЧНЫМ ОТ ИМЕНИ КЛАССА!!!
    private var animalViewMed:animalViewMediator = animalViewMediator.getInstance();
    private var animalDProxy:animalDataProxy = animalDataProxy.getInstance();
    private var animalComm:animalCommand = animalCommand.getInstance();
    private var commonComm:commonCommand = commonCommand.getInstance();
    private var faceBitM:Bitmap;


    // Модель данных юзера в ОК для передачи картинки анимала туда
    private static  var okDCVO:Object = okDataCommonVO.getInstance();

    private var animalDCommonProxy:animalDataCommonProxy =  animalDataCommonProxy.getInstance();



    public function animalFacade() {
        super(Constants.ANIMAL_WIDTH, Constants.ANIMAL_HEIGHT, false);


        if( instance ) throw new Error( "Singleton and can only be accessed through Singleton.getInstance()" );

        // Слушаем запрос на смену животного от медиатора диалога выбора животных левого меню
        commonComm.addEventListener(commonEvents.ANIMALCHANGEREQUEST, ANIMALCHANGEREQUEST_handler);

        // Слушаем запрос на смену лица от медиатора диалога выбора лица левого меню
        commonComm.addEventListener(commonEvents.FACECHANGEREQUEST, FACECHANGEREQUEST_handler);

        // Слушаем запрос на добавление хинта к лицу от любого компонента
        commonComm.addEventListener(commonEvents.FACEADDDELAYHINT, FACEADDDELAYHINT_handler);
        // Слушаем запрос на добавление хинта к лицу от MOOD
        commonComm.addEventListener(commonEvents.FACEADDDELAYHINTMOOD, FACEADDDELAYHINTMOOD_handler);
        // Слушаем запрос на добавление хинта к лицу от LEFT MENU
        commonComm.addEventListener(commonEvents.FACEADDDELAYHINTLEFTMENU, FACEADDDELAYHINTLEFTMENU_handler);

        // Слушаем запрос на генерацию битмапы из текущего контейнера с анималом и записи битмапы в okDCVO.imageToUpload
        commonComm.addEventListener(commonEvents.ANIMALFACADEGIVEANIMAL, ANIMALFACADEGIVEANIMAL_handler);

        // Послать запрос в главную команду на получение набора няшек
        commonComm.dispatchEvent(new commonEvents(commonEvents.LOADANIMALLISTTOSELECT));


        // Слушаем когда закончится обработка чтобы опять принимать запросы
        commonComm.addEventListener(commonEvents.FACADEFACEADDDELAYHINTCLOSED, FACEADDDELAYHINTCLOSED_handler);
        commonComm.addEventListener(commonEvents.FACADEFACEADDDELAYHINTMOODCLOSED, FACEADDDELAYHINTCLOSED_handler);
        commonComm.addEventListener(commonEvents.FACADEFACEADDDELAYHINTLEFTMENUCLOSED, FACEADDDELAYHINTCLOSED_handler);



        // Ставим няшку по умолчанию
       // animalDCommonProxy.animalFileToLoad = "owlchild";


        showAnimal();

        // Ставим лицо смайла по умолчанию

       // faceBitM = (new Resources.smile2) as Bitmap;
      //  animalDCommonProxy.faceResource = faceBitM;

 
        showFace();
    }

    private function FACEADDDELAYHINTLEFTMENU_handler(event:commonEvents):void {

        animalViewMed.EventOwner = "FACEADDDELAYHINTLEFTMENU";
        FACEADDDELAYHINT_handler(event);
    }

    private function FACEADDDELAYHINTMOOD_handler(event:commonEvents):void {



        animalViewMed.EventOwner = "FACEADDDELAYHINTMOOD";
        FACEADDDELAYHINT_handler(event);
    }

    private function ANIMALFACADEGIVEANIMAL_handler(event:commonEvents):void {

        // Делаем битмап из ресурса для манипуляций
        var bData:BitmapData;
        okDCVO.imageToUpload = new Bitmap(bData);
        bData = new BitmapData( animalViewMed.width, animalViewMed.height, false, 0xFFFFFFFF );
        // Создаем скриншот области экрана с картинкой
        bData.draw(animalViewMed);

        okDCVO.imageToUpload = new Bitmap(bData);

        // Послать уведомление что все готово
        commonComm.dispatchEvent(new commonEvents(commonEvents.ANIMALFACADEANIMALREADY));
    }

    private function FACEADDDELAYHINT_handler(event:commonEvents):void {

 

        // Убираем запросы на хинты при обработке текущего
        commonComm.removeEventListener(commonEvents.FACEADDDELAYHINT, FACEADDDELAYHINT_handler);
        commonComm.removeEventListener(commonEvents.FACEADDDELAYHINTMOOD, FACEADDDELAYHINTMOOD_handler);
        commonComm.removeEventListener(commonEvents.FACEADDDELAYHINTLEFTMENU, FACEADDDELAYHINTLEFTMENU_handler);


        // Играем случайный звук

        if(animalDCommonProxy.currentToolTip[3]){

            animalViewMed.playRandTrueSound();


        }else{

            animalViewMed.playRandFalseSound();


        }

        if(animalDCommonProxy.currentToolTip[4]){

            animalViewMed.oneTimeCallSet = animalDCommonProxy.currentToolTip[4];

        }

        // Берем из модели тайтл, мессадж и нижний оффсет а ниже берем позитивное или негативное для звука т.к. хинт будет снизу
        animalViewMed.addDelayHintToFace(animalDCommonProxy.currentToolTip[0], animalDCommonProxy.currentToolTip[1], animalDCommonProxy.currentToolTip[2]);

    }

    private function FACEADDDELAYHINTCLOSED_handler(event:commonEvents):void {

        commonComm.addEventListener(commonEvents.FACEADDDELAYHINT, FACEADDDELAYHINT_handler);
        commonComm.addEventListener(commonEvents.FACEADDDELAYHINTMOOD, FACEADDDELAYHINTMOOD_handler);
        commonComm.addEventListener(commonEvents.FACEADDDELAYHINTLEFTMENU, FACEADDDELAYHINTLEFTMENU_handler);

    }

    private function FACECHANGEREQUEST_handler(event:commonEvents):void {

        // При смене лица анимал не меняется!
        animalViewMed.removeFace();
        showFace();

    }


    // Это запрос на смену всего животного!!! не только лица!!!

    private function ANIMALCHANGEREQUEST_handler(event:commonEvents):void {

        // При смене животного менять лицо на стандартное!

        animalViewMed.removeAnimal();
        animalViewMed.removeFace();
        removeAllChildren();

        // Ставим лицо смайла по умолчанию

        /*
        var bData:BitmapData = animalDCommonProxy.faceResource.bitmapData;
        bData.dispose();
        bData = new BitmapData( faceSquare.width - 2, faceSquare.height - 2, false, 0xFFFFFFFF );
        */

        animalDCommonProxy.faceResource = null;
        faceBitM = (new Resources.smile2) as Bitmap;
        animalDCommonProxy.faceResource = faceBitM;



        // Если модель изменили - то не обязательно задавать параметр animalDCommonProxy.animalFileToLoad
        showAnimal();
        showFace();

    }

    // Предобработка для вызова через другие компоненты
    private function showAnimal():void {

        // Сразу отображаем вьюху
        addChild(animalViewMed as Sprite);
        //Просим её показать сову)
        animalViewMed.showAnimal();

    }

    // Предобработка для вызова через другие компоненты
    private function showFace():void {

        //Просим её показать смайлик)
        animalViewMed.showFace();

    }


    public static function getInstance():animalFacade {

        return instance;

    }



}
}
