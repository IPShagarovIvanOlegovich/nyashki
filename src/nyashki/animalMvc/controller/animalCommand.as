package nyashki.animalMvc.controller {

import flash.display.Sprite;
import helpers.Constants;
import helpers.Constants;
import helpers.Constants;

public final class animalCommand extends Sprite {



    private var _currentAnimalWithParams:Object;

    // Синглтон паттерн + public final class
    private static var instance:animalCommand = new animalCommand();

    public static function getInstance():animalCommand {

        return instance;

    }

    public function animalCommand() {

        if( instance ) throw new Error( "Singleton and can only be accessed through Singleton.getInstance()" );

    }


    public function checkLowParamsGetActions(currentAnimalWithParams:Object):Array {


        _currentAnimalWithParams = currentAnimalWithParams;

       var returnObj:Array = new Array();
       var checkObj:Array = new Array();

        returnObj["result"] = ({ minCompaundParam:0, minParam:0, possible:true, reason:"", tip:"", tipHeight:0 });

        // Проверка - сначала поиск наименьшего общего составного парама, затем внутри него - частного, когда нашли - поиск способа его увеличить
            var compaundParam1:Number = (currentAnimalWithParams['param11']+currentAnimalWithParams['param12']+currentAnimalWithParams['param13'])/3;
            var compaundParam2:Number = (currentAnimalWithParams['param21']+currentAnimalWithParams['param22']+currentAnimalWithParams['param23'])/3;
            var compaundParam3:Number = (currentAnimalWithParams['param31']+currentAnimalWithParams['param32']+currentAnimalWithParams['param33'])/3;


        // Если они все не на максимуме
        if(!(compaundParam1 == compaundParam2 == compaundParam3 == 3)){
            var minCompaundValue:Number = Math.min(compaundParam1, compaundParam2, compaundParam3);
            compaundParam1 == minCompaundValue ? returnObj.result.minCompaundParam = 1 : returnObj.result.minCompaundParam = returnObj.result.minCompaundParam;
            compaundParam2 == minCompaundValue ? returnObj.result.minCompaundParam = 2 : returnObj.result.minCompaundParam = returnObj.result.minCompaundParam;
            compaundParam3 == minCompaundValue ? returnObj.result.minCompaundParam = 3 : returnObj.result.minCompaundParam = returnObj.result.minCompaundParam;
        }else{

            // Возвращаем пустой объект с нулевым составным параметром т.е. все на максимуме
            returnObj.result.minCompaundParam = 0;

            // Подсказка что все на макс
            returnObj.result.tip = "Все настроение на максимуме! :-)";
            returnObj.result.tipHeight = 80;

           // Если нет - то сказать что все параметры намаксимальном значении
            return returnObj;
        }


        // Если нашли минимальный составной - поиск минимального частного
        if(returnObj.result.minCompaundParam){
            var Param1:Number = currentAnimalWithParams['param'+returnObj.result.minCompaundParam+'1'];
            var Param2:Number = currentAnimalWithParams['param'+returnObj.result.minCompaundParam+'2'];
            var Param3:Number = currentAnimalWithParams['param'+returnObj.result.minCompaundParam+'3'];
            var minParamValue:Number = Math.min(Param1, Param2, Param3);
            Param1 == minParamValue ? returnObj.result.minParam = 1 : returnObj.result.minParam = returnObj.result.minParam;
            Param2 == minParamValue ? returnObj.result.minParam = 2 : returnObj.result.minParam = returnObj.result.minParam;
            Param3 == minParamValue ? returnObj.result.minParam = 3 : returnObj.result.minParam = returnObj.result.minParam;
        }


        // Проверка возможности для данного парама, если он найден.. Если нет - то ничего не делать тк уже вернули максимум
         if(returnObj.result.minParam){

             checkObj = checkActionsForParam( String(returnObj.result.minCompaundParam) + String(returnObj.result.minParam) );

             if( checkObj.result.possible ){
                 // Если возможно улучшение - даем подсказку
                 returnObj.result.possible = checkObj.result.possible;
                 if(minParamValue == -3){
                     checkObj.result.tip = "Срочно принимай меры! Самое низкое значение у " + Constants.PARAMHNAMES["param" + String(returnObj.result.minCompaundParam) + String(returnObj.result.minParam)].nameH +". "+ checkObj.result.tip;
                 }
                 returnObj.result.tip = checkObj.result.tip;
                 returnObj.result.tipHeight = 40;
                 return returnObj;
             }else{
                 // Если нет - проверяем причину на возможность улучшения, т.к. в причине тот парам изза котор нелья

                 checkObj = checkActionsForParam( checkObj.result.reason.slice(-2) );

                         if( checkObj.result.possible ){
                             // Если возможно улучшение - даем подсказку
                             returnObj.result.possible = checkObj.result.possible;
                             returnObj.result.tip = checkObj.result.tip;
                             returnObj.result.tipHeight = 40;
                             return returnObj;

                         }else{
                             returnObj.result.possible = checkObj.result.possible;
                             // Если нет - пишем что причину можно увеличить через виралку
                             // А также даем подсказку что можно увеличить любой параметр запостив на стену и тп
                             returnObj.result.tip = "Можно улучшить " + Constants.PARAMHNAMES[checkObj.result.reason].nameH + " разместив няшку на стену, отправив другу или в статус";
                             returnObj.result.tipHeight = 40;
                             return returnObj;
                         }

             }

         }

        return returnObj;

    }


    public function checkActionsForParam(currentParam:String):Array {

        var returnObj:Array = new Array();
        returnObj["result"] = ({ possible:true, reason:"", tip:"" });

        outerLoop: for(var i:int = 1; i <= 3; i++){

          var currentAction:String = String(currentParam) + String(i);

          var actionPoss:Object = Constants.ACTIONPOSSIBILITY[currentAction];



                // Сверка действия с моделью возможности действия, если возможно - выдать подсказку из данной акции, если нет - проверить акции того параметра изза котор невозможно через верх
                if(actionPoss.notPossibleIf1 != ""){
                    if(_currentAnimalWithParams[actionPoss.notPossibleIf1] < 1) {
                        returnObj.result.possible = false;
                        returnObj.result.reason = actionPoss.notPossibleIf1;
                        continue outerLoop;
                    }
                }

                if(actionPoss.notPossibleIf2 != ""){
                    if(_currentAnimalWithParams[actionPoss.notPossibleIf2] < 1) {
                        returnObj.result.possible = false;
                        returnObj.result.reason = actionPoss.notPossibleIf2;
                        continue outerLoop;
                    }
                }

                if(actionPoss.notPossibleIf3 != ""){
                    if(_currentAnimalWithParams[actionPoss.notPossibleIf3] < 1) {
                        returnObj.result.possible = false;
                        returnObj.result.reason = actionPoss.notPossibleIf3;
                        continue outerLoop;
                    }
                }

            // Если пройдя цикл проверок выяснилось что данная акция возможна - отправить + результат с подсказкой к акции, типа "я бы хотел чтото такое"
            if( returnObj.result.possible == true ){
                returnObj.result.tip = Constants.ACTIONS[currentAction].tip;
                return returnObj;
            }
        }

        return returnObj;

    }


}
}
