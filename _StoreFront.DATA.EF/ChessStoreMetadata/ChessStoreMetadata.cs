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
        public string FirstName { get; set; }


        public string LastName { get; set; }


        public string PositionTitle { get; set; }


        public Nullable<int> DirectReportID { get; set; }


        public int DepartmentID { get; set; }
    }

    #endregion

    #region Product Metadata

    #endregion

    #region Product Category Metadata

    #endregion

    #region Product Status Metadata

    #endregion



}
