using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.ComponentModel.DataAnnotations; //added for metadata and validation

namespace _StoreFront.DATA.EF//.ChessStoreMetadata - name must match the namespace of classes these partial classes will buddy up with.
{
    #region Department Metadata
    public class DepartmentMetadata
    {
        [Required]
        [Display(Name = "Department Name")]
        [StringLength(50, ErrorMessage = "*Max 50 characters")]
        public string DepartmentName { get; set; }
    }

    [MetadataType(typeof(DepartmentMetadata))]
    public partial class Department { }

    #endregion

    #region Employee Metadata

    public class EmployeeMetadata
    {
        [Required]
        [Display(Name = "First Name")]
        [StringLength(20, ErrorMessage = "*Max 20 characters")]
        public string FirstName { get; set; }

        [Required]
        [Display(Name = "Last Name")]
        [StringLength(50, ErrorMessage = "*Max 50 characters")]
        public string LastName { get; set; }

        [Required]
        [Display(Name = "Position")]
        [StringLength(20, ErrorMessage = "*Max 20 characters")]
        [DisplayFormat(NullDisplayText = "N/A")]
        public string PositionTitle { get; set; }


        //public Nullable<int> DirectReportID { get; set; }

        //public int DepartmentID { get; set; }

        [MetadataType(typeof(EmployeeMetadata))]
        public partial class Employee { }
    }

    #endregion

    #region Product Metadata
    public class ProductMetadata
    {
        //public int ProductID { get; set; }

        [Required]
        [Display(Name = "Product Name")]
        [StringLength(50, ErrorMessage = "*Max 50 characters")]
        public string ProductName { get; set; }

        [Required]
        [Display(Name = "Product Description")]
        [StringLength(200, ErrorMessage = "*Max 200 characters")]
        [UIHint("MultilineText")]
        public string ProductDescription { get; set; }

        //public int ProductCategoryID { get; set; }

        //public int ProductStatusID { get; set; }

        [Display(Name = "Yearly Price")]
        [DisplayFormat(DataFormatString = "{0:c}", NullDisplayText = "N/A")]//Is this NullDisplayText correct?
        [Required(ErrorMessage = "Price is required")]
        [Range(0, double.MaxValue, ErrorMessage = "Value must be 0 or larger.")]
        public Nullable<decimal> Price { get; set; }

        //public string ProductImage { get; set; }

        [MetadataType(typeof(ProductMetadata))]
        public partial class Product { }
    }
    #endregion

    #region Product Category Metadata
    public class ProductCategory1Metadata
    {
        [Required]
        [Display(Name = "Product Category")]
        public string ProductCategory1 { get; set; }

        [MetadataType(typeof(ProductCategory1Metadata))]
        public partial class ProductCategory { }
    }
    #endregion

    #region Product Status Metadata
    public class ProductStatusMetadata
    {
        [Required]
        [Display(Name = "Status")]
        [DisplayFormat(NullDisplayText = "N/A")]
        public string StatusName { get; set; }

        [MetadataType(typeof(ProductStatusMetadata))]
        public partial class ProductStatus { }
    }
    #endregion


}
