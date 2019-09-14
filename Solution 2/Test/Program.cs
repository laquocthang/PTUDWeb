using DataAccess;
using System;
using System.Collections.Generic;
using System.Linq;

namespace Test
{
	class Program
	{
		static void Main(string[] args)
		{
			Console.WriteLine("Paging:");
			int pages;
			List<Movie> danhSach = Movie.Paging(1, 2, out pages);
			foreach (var item in danhSach)
			{
				Console.WriteLine(item);
			}
			Console.ReadKey();
		}
	}
}
