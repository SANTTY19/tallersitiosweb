using System;
using System.Data;
using System.Data.SqlClient;

namespace TallerSitiosWeb
{
    public partial class index : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                cargardatos();
            }
        }

        private void cargardatos()
        {
            // Conexión a la base de datos (cambia la cadena de conexión según tu configuración)
            string connectionString = "Server=DESKTOP-2QG3ADD;Database=tallersitiosweb;User Id=sa;Password=root;";
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                SqlCommand cmd = new SqlCommand("SELECT * FROM Imagenes", con);
                con.Open();
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);

                // Enlaza los datos al control Repeater
                rptImagenes.DataSource = dt;
                rptImagenes.DataBind();
            }
        }
    }
}
