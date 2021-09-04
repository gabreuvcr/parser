class A {
    x: Int;
    y : Bool;
    z : String;

    init(x_ : Int, y_: Bool, z_: String) : A {
        {
            x <- x_;
            y <- y_;
            z <- z_;
            self;
        }
    };
};

Class BB__ inherits A {
};

class Main inherits IO {
    main(): Object {
        let testA: A <- (new A).init(10, true, "Banana") in {
            case testA of 
                dummy: A => out_string("class A\n");
                dummy: BB__ => out_string("class B\n");
            esac;
        }
    };
};