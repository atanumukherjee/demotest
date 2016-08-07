
public class mytest2 {

	public static void main(String[] args) {
		sayHello();
		mytest1.sayHello();
	}

	public static void sayHello() {
		System.out.println("MyTest2 says hello!");
		 System.out.println("This is the example of dependency");
	}

	}


