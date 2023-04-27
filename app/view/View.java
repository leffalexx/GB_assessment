package app.view;

import java.util.Scanner;

public class View {
    private static Scanner scanner = new Scanner(System.in);

    public static void mainMenu() {
        System.out.printf("%s\n%s\n%s\n%s\n",
        "1 Завести новое животное",
        "2 Показать список всех команд",
        "3 Добавить новую команду всем животным",
        "4 Выход");
    }

    public static String userInput() {
        System.out.println("Введите команду: ");
        return scanner.nextLine();
    }

    public static void subMenu() {
        System.out.println("Введите через пробел вид, кличку и возраст животоного");
    }
}