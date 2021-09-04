  
(* Greet a person *)

class Main inherits IO
{

	main(): Object
	{		
		(* Variables in the following block *)
		let name: String,
			time_of_the_day: String in
		{
			out_string("Enter your name: ");
			name <- in_string();

			out_string("Enter time of the day: ");
			time_of_the_day <- in_string();

			out_string("Good ".concat(time_of_the_day).concat(", ").concat(name).concat("!\n"));
		}
	};
};

(* Sample execution:
	$ ./cool greeting.cl
	Enter your name: Rafi                                  
	Enter time of the day: evening
	Good evening, Rafi! 
*)