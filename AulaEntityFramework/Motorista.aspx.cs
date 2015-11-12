using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AulaEntityFramework
{
    public partial class Motorista1 : System.Web.UI.Page
    {
        SeguradoraEntities se = new SeguradoraEntities();

        protected void Page_Load(object sender, EventArgs e)
        {
            CarregarGrid();
        }

        private void CarregarGrid()
        {

            var dados = se.Motoristas.Select(x => new {
                x.Id, x.Nome, x.Endereco, x.CNH 
            }).OrderByDescending(y => y.Id);

            GridViewMotorista.DataSource = dados;

            GridViewMotorista.DataBind();

        }

        protected void btnCadastrarMotorista_Click(object sender, EventArgs e)
        {
            
            Motorista mt = new Motorista();

            mt.Nome = txtNome.Text;
            mt.Endereco = txtEndereco.Text;
            mt.CNH = int.Parse(txtCNH.Text);

            se.AddToMotoristas(mt);
            se.SaveChanges();

            Response.Redirect(Request.RawUrl);

        }

        protected void GridViewMotorista_SelectedIndexChanged(object sender, EventArgs e)
        {
            lblID.Text = GridViewMotorista.SelectedRow.Cells[2].Text;
            txtNome.Text = GridViewMotorista.SelectedRow.Cells[3].Text;
            txtEndereco.Text = GridViewMotorista.SelectedRow.Cells[4].Text;
            txtCNH.Text = GridViewMotorista.SelectedRow.Cells[5].Text;
        }

        protected void btnAtualizar_Click(object sender, EventArgs e)
        {

            int id = 0;

            id = (int) GridViewMotorista.SelectedValue;

            Motorista mt = new Motorista();

            mt = se.Motoristas.Where(x => x.Id == id).FirstOrDefault();

            mt.Nome = txtNome.Text;
            mt.Endereco = txtEndereco.Text;
            mt.CNH = int.Parse(txtCNH.Text);

            se.ApplyPropertyChanges("Motoristas", mt);

            se.SaveChanges();

            Response.Redirect(Request.RawUrl);

        }

        protected void GridViewMotorista_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName.Equals("detalhes"))
            {
                int linha = int.Parse((string)e.CommandArgument);
                int id = int.Parse(GridViewMotorista.Rows[linha].Cells[2].Text);

                Session["idMotorista"] = id;
                Response.Redirect("Veiculo.aspx");
            }
        }

    }
}