package com.common;

public class Person {
    private String name;
    private int age;

    public Person(){} //기본생성자
    public Person(String name, int age){
        super();
        this.age = age;
        this.name = name;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getAge() {
        return age;
    }

    public void setAge(int age) {
        this.age = age;
    }
}
