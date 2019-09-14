using Core;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;

namespace DataAccess
{
	public class SqlDataProvider_2 : DataProvider
	{
		private string connectionString;

		/// <summary>
		/// Set connection string to SqlDataProvider
		/// </summary>
		/// <param name="connectionStringName"></param>
		public SqlDataProvider_2(string connectionStringName)
		{
			connectionString = ConfigurationManager.ConnectionStrings[connectionStringName].ConnectionString;
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

		public override int PostAdd(Post post)
		{
			string spName = "Post_Add";
			SqlParameter[] parameters = SqlHelperParameterCache.GetSpParameterSet(connectionString, spName);
			AssignParameterValues(parameters, new object[] { post.PostID, post.Title, post.Body, post.Publish });
			//Get the parameters from memory
			int result = SqlHelper.ExecuteNonQuery(connectionString, System.Data.CommandType.StoredProcedure, spName, parameters);
			if (result > 0)
			{
				foreach (var item in parameters)
					if (string.Compare(item.ParameterName, "@PostID", true) == 0)
						return (int)item.Value;
			}
			return result;
		}

		/// <summary>
		/// Automatically assign value into SqlParameter
		/// </summary>
		/// <param name="commandParameters"></param>
		/// <param name="parameterValues"></param>
		private void AssignParameterValues(SqlParameter[] commandParameters, object[] parameterValues)
		{
			if ((commandParameters == null) || (parameterValues == null))
				return;
			if (commandParameters.Length != parameterValues.Length)
				throw new ArgumentException("Parameter count does not match ParameterValue count");
			for (int i = 0; i < commandParameters.Length; i++)
				commandParameters[i].Value = parameterValues[i];
		}

		public override List<Post> PostAll()
		{
			return CBO.FillCollection<Post>(SqlHelper.ExecuteReader(connectionString, "Post_All"));
		}

		public override int PostCount()
		{
			object rs = SqlHelper.ExecuteScalar(connectionString, "Post_Count");
			return Convert.ToInt32(rs);
		}

		public override int PostDelete(Post post)
		{
			return SqlHelper.ExecuteNonQuery(connectionString, "Post_Delete", post.PostID);
		}

		public override List<Post> PostFind(string title)
		{
			return CBO.FillCollection<Post>(SqlHelper.ExecuteReader(connectionString, "Post_Find", title));
		}

		public override Post PostSingle(int postID)
		{
			return CBO.FillObject<Post>(SqlHelper.ExecuteReader(connectionString, "Post_Single", postID));
		}

		public override int PostUpdate(Post post)
		{
			return SqlHelper.ExecuteNonQuery(connectionString, "Post_Update", post.PostID, post.Title, post.Body, post.Publish);
		}
	}
}
