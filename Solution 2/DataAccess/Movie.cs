using Core;
using System;
using System.Collections.Generic;
using System.Data;

namespace DataAccess
{
	public class Movie
	{
		public int id { get; set; }
		public string Title { get; set; }
		public string Director { get; set; }
		public DateTime DateReleased { get; set; }
		public bool InTheaters { get; set; }
		public double BoxOfficeTotals { get; set; }
		public String Description { get; set; }

		public Movie()
		{

		}

		public static List<Movie> All() => CBO.FillCollection<Movie>(DataProvider.Instance.ExecuteReader("Movie_All"));

		public static List<Movie> Find(string title) => CBO.FillCollection<Movie>(DataProvider.Instance.ExecuteReader("Movie_Find", title));

		public static Movie Single(string postId)
		{
			try
			{
				return CBO.FillObject<Movie>(DataProvider.Instance.ExecuteReader("Movie_Single", Convert.ToInt32(postId)));
			}
			catch (Exception)
			{
				return null;
			}
		}

		public static int Count()
		{
			object result = DataProvider.Instance.ExecuteScalar("Movie_Count");
			return Convert.ToInt32(result);
		}

		public static int Add(Movie data)
		{
			object result = DataProvider.Instance.ExecuteNonQueryWithOutput("@Id", "Movie_Add", data.id, data.Title, data.Director, data.DateReleased, data.InTheaters, data.BoxOfficeTotals, data.Description);
			int identity = result != null ? Convert.ToInt32(result) : 0;
			return identity;
		}

		public static bool Update(Movie data)
		{
			int result = DataProvider.Instance.ExecuteNonQuery("Movie_Update", data.id, data.Title, data.Director, data.DateReleased, data.InTheaters, data.BoxOfficeTotals, data.Description);
			return result > 0;
		}

		public static bool Delete(string id)
		{
			try
			{
				int result = DataProvider.Instance.ExecuteNonQuery("Movie_Delete", Convert.ToInt32(id));
				return result > 0;
			}
			catch (Exception)
			{
				return false;
			}
		}

		public static List<Movie> Paging(int page, int pageSize, out int howManyPages)
		{
			IDataReader reader = null;
			try
			{
				reader = DataProvider.Instance.ExecuteReader("Movie_Paging", page, pageSize);
				reader.Read();
				howManyPages = (int)Math.Ceiling((double)reader.GetInt32(0) / (double)pageSize);
				reader.NextResult();
				return CBO.FillCollection<Movie>(reader);
			}
			catch
			{
				if (reader != null && reader.IsClosed == false)
					reader.Close();
				howManyPages = 0;
				return new List<Movie>();
			}
		}

		public override string ToString()
		{
			return string.Format("Id : {0}, Title: {1}", id, Title);
		}
	}
}
