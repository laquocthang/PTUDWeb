using Core;
using System;
using System.Collections.Generic;

namespace DataAccess
{
	public class Post
	{
		public int PostID { get; set; }
		public string Title { get; set; }
		public string Body { get; set; }
		public DateTime? Publish { get; set; }

		public Post()
		{

		}

		public static List<Post> All() => CBO.FillCollection<Post>(DataProvider.Instance.ExecuteReader("Post_All"));

		public static List<Post> Find(string title) => CBO.FillCollection<Post>(DataProvider.Instance.ExecuteReader("Post_Find", title));

		public static Post Single(string postId)
		{
			try
			{
				return CBO.FillObject<Post>(DataProvider.Instance.ExecuteReader("Post_Single", Convert.ToInt32(postId)));
			}
			catch (Exception)
			{
				return null;
			}
		}

		public static int Count()
		{
			object result = DataProvider.Instance.ExecuteScalar("Post_Count");
			return Convert.ToInt32(result);
		}

		public static int Add(Post data)
		{
			object result = DataProvider.Instance.ExecuteNonQueryWithOutput("@PostID", "Post_Add", data.PostID, data.Title, data.Body, data.Publish);
			int identity = result != null ? Convert.ToInt32(result) : 0;
			return identity;
		}

		public static bool Update(Post data)
		{
			int result = DataProvider.Instance.ExecuteNonQuery("Post_Update", data.PostID, data.Title, data.Body, data.Publish);
			return result > 0;
		}

		public static bool Delete(string postId)
		{
			try
			{
				int result = DataProvider.Instance.ExecuteNonQuery("Post_Delete", Convert.ToInt32(postId));
				return result > 0;
			}
			catch (Exception)
			{
				return false;
			}
		}
	}
}

