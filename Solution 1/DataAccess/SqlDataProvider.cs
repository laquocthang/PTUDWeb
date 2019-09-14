using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

namespace DataAccess
{
	/// <summary>
	/// The Sql's DataProvider
	/// </summary>
	public class SqlDataProvider : DataProvider
	{
		private string connectionString;

		/// <summary>
		/// Set connection string to SqlDataProvider
		/// </summary>
		/// <param name="connectionStringName"></param>
		public SqlDataProvider(string connectionStringName)
		{
			connectionString = ConfigurationManager.ConnectionStrings[connectionStringName].ConnectionString;
		}

		/// <summary>
		/// Call Post_Add Stored Procedure from Database to insert records to Post table
		/// </summary>
		/// <param name="post"></param>
		/// <returns></returns>
		public override int PostAdd(Post post)
		{
			using (SqlConnection connection = GetSqlConnection())
			{
				SqlCommand command = connection.CreateCommand();
				command.CommandType = CommandType.StoredProcedure;
				command.CommandText = "Post_Add";
				command.Parameters.Add("@PostID", SqlDbType.Int).Direction = ParameterDirection.Output;
				command.Parameters.Add("@Title", SqlDbType.NVarChar, 50).Value = post.Title;
				command.Parameters.Add("@Body", SqlDbType.NVarChar, 4000).Value = post.Body;
				if (post.Publish.HasValue)
					command.Parameters.Add("@Publish", SqlDbType.DateTime).Value = post.Publish.Value;
				else
					command.Parameters.Add("@Publish", SqlDbType.DateTime).Value = DBNull.Value;
				connection.Open();
				int result = command.ExecuteNonQuery();
				if (result > 0) return (int)command.Parameters["@PostID"].Value;
				return 0;
			}
		}

		/// <summary>
		/// Get SqlConnection
		/// </summary>
		/// <returns></returns>
		protected SqlConnection GetSqlConnection()
		{
			try
			{
				return new SqlConnection(connectionString);
			}
			catch
			{
				throw new System.Exception("SqlConnection");
			}
		}

		public override int PostUpdate(Post post)
		{
			using (SqlConnection connection = GetSqlConnection())
			{
				SqlCommand command = connection.CreateCommand();
				command.CommandType = CommandType.StoredProcedure;
				command.CommandText = "Post_Update";
				command.Parameters.Add("@PostID", SqlDbType.Int).Value = post.PostID;
				command.Parameters.Add("@Title", SqlDbType.NVarChar, 50).Value = post.Title;
				command.Parameters.Add("@Body", SqlDbType.NVarChar, 4000).Value = post.Body;
				if (post.Publish.HasValue)
					command.Parameters.Add("@Publish", SqlDbType.DateTime).Value = post.Publish.Value;
				else
					command.Parameters.Add("@Publish", SqlDbType.DateTime).Value = DBNull.Value;
				connection.Open();
				int result = command.ExecuteNonQuery();
				if (result > 0) return (int)command.Parameters["@PostID"].Value;
				return 0;
			}
		}

		public override int PostDelete(Post post)
		{
			using (SqlConnection connection = GetSqlConnection())
			{
				SqlCommand command = connection.CreateCommand();
				command.CommandType = CommandType.StoredProcedure;
				command.CommandText = "Post_Delete";
				command.Parameters.Add("@PostID", SqlDbType.Int).Value = post.PostID;
				connection.Open();
				int result = command.ExecuteNonQuery();
				if (result > 0) return (int)command.Parameters["@PostID"].Value;
				return 0;
			}
		}

		public override int PostCount()
		{
			using (SqlConnection connection = GetSqlConnection())
			{
				SqlCommand command = connection.CreateCommand();
				command.CommandType = CommandType.StoredProcedure;
				command.CommandText = "Post_Count";
				connection.Open();
				object result = command.ExecuteScalar(); //return the first record
				return Convert.ToInt32(result);
			}
		}

		public override List<Post> PostAll()
		{
			using (SqlConnection connection = GetSqlConnection())
			{
				SqlCommand command = connection.CreateCommand();
				command.CommandType = CommandType.StoredProcedure;
				command.CommandText = "Post_All";
				connection.Open();
				using (SqlDataReader reader = command.ExecuteReader(CommandBehavior.CloseConnection))
				{
					List<Post> list = new List<Post>();
					while (reader.Read())
					{
						Post post = new Post();
						post.PostID = Convert.ToInt32(reader["PostID"]);
						post.Title = reader["Title"].ToString();
						post.Body = reader["Body"].ToString();
						if (reader["Publish"] != DBNull.Value)
							post.Publish = DateTime.Parse(reader["Publish"].ToString());
						list.Add(post);
					}
					return list;
				}
			}
		}

		public override Post PostSingle(int postID)
		{
			using (SqlConnection connection = GetSqlConnection())
			{
				SqlCommand command = connection.CreateCommand();
				command.CommandType = CommandType.StoredProcedure;
				command.CommandText = "Post_Single";
				command.Parameters.Add("@PostID", SqlDbType.Int).Value = postID;
				connection.Open();
				using (SqlDataReader reader = command.ExecuteReader(CommandBehavior.CloseConnection))
				{
					reader.Read();
					Post post = new Post();
					post.PostID = Convert.ToInt32(reader["PostID"]);
					post.Title = reader["Title"].ToString();
					post.Body = reader["Body"].ToString();
					if (reader["Publish"] != DBNull.Value)
						post.Publish = DateTime.Parse(reader["Publish"].ToString());
					return post;
				}
			}
		}

		public override List<Post> PostFind(string title)
		{
			using (SqlConnection connection = GetSqlConnection())
			{
				SqlCommand command = connection.CreateCommand();
				command.CommandType = CommandType.StoredProcedure;
				command.CommandText = "Post_Find";
				command.Parameters.Add("@Title", SqlDbType.NVarChar).Value = title;
				connection.Open();
				using (SqlDataReader reader = command.ExecuteReader(CommandBehavior.CloseConnection))
				{
					List<Post> list = new List<Post>();
					while (reader.Read())
					{
						Post post = new Post();
						post.PostID = Convert.ToInt32(reader["PostID"]);
						post.Title = reader["Title"].ToString();
						post.Body = reader["Body"].ToString();
						if (reader["Publish"] != DBNull.Value)
							post.Publish = DateTime.Parse(reader["Publish"].ToString());
						list.Add(post);
					}
					return list;
				}
			}
		}
	}
}
