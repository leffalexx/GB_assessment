package app.logic;

import app.view.View;
import app.model.Animal;
import app.model.Camel;
import app.model.Cat;
import app.model.Dog;
import app.model.Horse;
import app.model.Donkey;
import app.model.Hamster;

import java.util.ArrayList;
import java.util.List;

public class Logic {
    List<Animal> animals = new ArrayList<>();

    public void addCommand() {
        Animal.getCommands().add(View.userInput());
        System.out.println();
        System.out.println("Команда добавлена\n");
    }

    public void addAnimal() {
        View.subMenu();

        String[] input = View.userInput().split(" ");

        try {
            if (input.length != 3 || input[2].matches("\\d")) {
                throw new IllegalArgumentException("Неправильный формат ввода");
            }
        
            switch (input[0].toLowerCase()) {
                case "camel":
                    animals.add(new Camel(input[1], Integer.parseInt(input[2])));
                    break;
                case "cat":
                    animals.add(new Cat(input[1], Integer.parseInt(input[2])));
                    break;
                case "dog":
                    animals.add(new Dog(input[1], Integer.parseInt(input[2])));
                    break;
                case "horse":
                    animals.add(new Horse(input[1], Integer.parseInt(input[2])));
                    break;
                case "donkey":
                    animals.add(new Donkey(input[1], Integer.parseInt(input[2])));
                    break;
                case "hamster":
                    animals.add(new Hamster(input[1], Integer.parseInt(input[2])));
                    break;
                default:
                    throw new IllegalArgumentException("Неправильный тип животного");
            }
        } catch (IllegalArgumentException e) {
            System.out.println("Ошибка: " + e.getMessage() + "\n");
        }
    }

    public void showCommands() {
        if (animals.size() == 0) {
            System.out.println("Животных нет\n");
            return;
        }

        if (Animal.getCommands().size() == 0) {
            System.out.println("Команд нет\n");
            return;
        }

        Animal.getCommands().forEach(System.out::println);
    }
}
