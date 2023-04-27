package app.controller;

import app.logic.Logic;
import app.view.View;

public class Controller {
    Logic logic = new Logic();

    public void start() {
        while (true) {
            try {
                View.mainMenu();
                String input = View.userInput();

                switch (input) {
                    case "1" -> logic.addAnimal();
                    case "2" -> logic.showCommands();
                    case "3" -> logic.addCommand();
                    case "4" -> {
                        return;
                    }
                    default -> throw new IllegalArgumentException("Ошибка ввода");
                }
            } catch (IllegalArgumentException e) {
                System.err.println(e.getMessage());
            }
        }
    }
}
