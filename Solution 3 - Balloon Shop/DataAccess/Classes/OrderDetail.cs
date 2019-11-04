﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataAccess.Classes
{
	public partial class OrderDetail
	{
		public int OrderID { get; set; }
		public int ProductID { get; set; }
		public string ProductName { get; set; }
		public int Quantity { get; set; }
		public decimal UnitCost { get; set; }
		public decimal? Subtotal { get; set; }

		public OrderDetail()
		{

		}
	}
}
