using DataAccess;
using System;

namespace Test
{
	class Program
	{
		public static DateTime? DataTime { get; private set; }

		static void Main(string[] args)
		{
			Post post = new Post();
			post.Title = "A title";
			post.Body = "Lorem Ip Sum";
			post.Publish = DateTime.Now;
			int result = DataProvider.Instance.PostAdd(post);
			if (result > 0) Console.WriteLine("New post id is " + result);
			else Console.WriteLine("Insert failed!");
			//Post post = new Post();
			//post.PostID = DataProvider.Instance.PostCount();
			//int result = DataProvider.Instance.PostDelete(post);
			//if (result > 0) Console.WriteLine("Succeed!");
			//else Console.WriteLine("Failed!");
			Console.ReadKey();
		}
	}
}
