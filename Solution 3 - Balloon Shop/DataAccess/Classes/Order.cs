using Core;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataAccess.Classes
{
	public partial class Order
	{
		public int OrderID { get; set; }
		public DateTime DateCreated { get; set; }
		public DateTime? DateShipped { get; set; }
		public string Comments { get; set; }
		public string FirstName { get; set; }
		public string LastName { get; set; }
		public string Email { get; set; }
		public string Phone { get; set; }
		public string ShippingAddress { get; set; }
		public int Status { get; set; }
		public string Username { get; set; }
		public double TotalAmount { get; set; }
		public enum OrderStatus { Pending = 0, Completed = 1, Canceled = 2 }

		public Order()
		{

		}

		public static List<Order> ByDate(string startDate, string endDate)
		{
			try
			{
				return CBO.FillCollection<Order>(DataProvider.Instance.ExecuteReader("Order_ByDate", startDate, endDate));
			}
			catch (Exception)
			{
				return new List<Order>();
			}
		}

		public static List<Order> ByRecent(int count)
		{
			return CBO.FillCollection<Order>(DataProvider.Instance.ExecuteReader("Order_ByRecent", count));
		}

		public static List<Order> ByStatus(int status)
		{
			return CBO.FillCollection<Order>(DataProvider.Instance.ExecuteReader("Order_ByStatus", status));
		}

		public static List<OrderDetail> Details(string orderId)
		{
			return CBO.FillCollection<OrderDetail>(DataProvider.Instance.ExecuteReader("Order_Details", orderId));
		}

		public static Order Single(string orderId)
		{
			return CBO.FillObject<Order>(DataProvider.Instance.ExecuteReader("Order_Single", orderId));
		}

		public static bool Update(Order order)
		{
			try
			{
				int result = DataProvider.Instance.ExecuteNonQuery("Order_Update", order.OrderID, order.DateCreated, order.DateShipped, order.Comments, order.FirstName, order.LastName, order.Email, order.Phone, order.ShippingAddress, order.Status);
				return result > 0;
			}
			catch (Exception)
			{
				return false;
			}
		}

		public static bool UpdateStatus(string orderId, Order.OrderStatus status)
		{
			try
			{
				int result = DataProvider.Instance.ExecuteNonQuery("Order_UpdateStatus", Convert.ToInt32(orderId), (int)status);
				return result > 0;
			}
			catch (Exception)
			{
				return false;
			}
		}
	}
}