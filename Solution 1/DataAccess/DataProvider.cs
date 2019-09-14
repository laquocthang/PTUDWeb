using System.Collections.Generic;

namespace DataAccess
{
	/// <summary>
	/// The abstraction class of DataProvider
	/// </summary>
	public abstract class DataProvider
	{
		public abstract int PostAdd(Post post);
		public abstract int PostUpdate(Post post);
		public abstract int PostDelete(Post post);
		public abstract int PostCount();
		public abstract List<Post> PostAll();
		public abstract Post PostSingle(int postID);
		public abstract List<Post> PostFind(string title);

		private static DataProvider instance = null;

		/// <summary>
		/// Singleton Pattern
		/// </summary>
		public static DataProvider Instance
		{
			get
			{
				if (instance == null)
					instance = new SqlDataProvider_2("ConnectionString");
				return instance;
			}
		}
	}
}
