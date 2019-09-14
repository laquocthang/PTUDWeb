using System;

namespace DataAccess
{
	/// <summary>
	/// A table in Sample Database
	/// </summary>
	public class Post
	{
		private int postID;
		private string title;
		private string body;
		private DateTime? publish;

		public int PostID { get => postID; set => postID = value; }
		public string Title { get => title; set => title = value; }
		public string Body { get => body; set => body = value; }
		public DateTime? Publish { get => publish; set => publish = value; }

		public Post()
		{

		}
	}
}
