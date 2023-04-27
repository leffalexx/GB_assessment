package app.model;

import java.util.List;
import java.util.ArrayList;

public abstract class Animal {
    protected int count;
    protected String name;
    protected int age;
    protected static List<String> commands = new ArrayList<>();

    public Animal (String name, int age) {
        this.name = name;
        this.age = age;
        count++;
    }

    public int getCount() {
        return count;
    }
    
    public static List<String> getCommands() {
        return commands;
    }
}