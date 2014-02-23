package nyashki {

import nyashki.animalMvc.animalFacade;
import nyashki.friendsMvc.friendsFacade;
import nyashki.leftMenuMvc.LeftMenuFacade;
import nyashki.moodMvc.moodFacade;


public class ApplicationFacade {

    private static var leftMenuCont:LeftMenuFacade = LeftMenuFacade.getInstance();
    private static var animalCont:animalFacade = animalFacade.getInstance();
    private static var moodMenuCont:moodFacade = moodFacade.getInstance();
    private static var friendsMenuCont:friendsFacade = friendsFacade.getInstance();


    public function ApplicationFacade() {

        // Начинаем добавление фасадов
        // Сверху и снизу отступы по 20 пикс, между каждым отступы по 10 пикселей


        // Фасад с животным
        animalCont.x = 120;
        animalCont.y = 20;
        addChild(animalCont);

        // Фасад с левым меню
        leftMenuCont.x = 20;
        leftMenuCont.y = 20;
        addChild(leftMenuCont);




        // Фасад с параметрами
        moodMenuCont.x = 501;
        moodMenuCont.y = 20;

        // moodCont.debug(true);
        addChild(moodMenuCont);

        // Фасад с друзьями
        friendsMenuCont.x = 620;
        friendsMenuCont.y = 20;

        // friendsCont.debug(true);
        addChild(friendsMenuCont);

    }




}
}
