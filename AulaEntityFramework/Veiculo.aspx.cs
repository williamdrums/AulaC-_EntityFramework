using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AulaEntityFramework
{
    public partial class Veiculo1 : System.Web.UI.Page
    {

        SeguradoraEntities se = new SeguradoraEntities();
        int id = 0;
        Motorista motorista = new Motorista();

        protected void Page_Load(object sender, EventArgs e)
        {
            
            id = (int)Session["idMotorista"];
            motorista = se.Motoristas.Where(x => x.Id == id).FirstOrDefault();
            txtMotorista.Text = motorista.Nome;

            CarregarGridVeiculo(motorista);

        }

        private void CarregarGridVeiculo(Motorista motorista)
        {
            var dados = se.Veiculoes.Select(x => new
            {
                x.Id,
                x.Marca,
                x.Modelo,
                x.Placa,
                x.Ano,
                x.Motorista
            }).Where(y => y.Motorista.Id == motorista.Id).ToList();

            if (dados.Count == 0)
            {
                lblMsg.Text = "O motorista "+ motorista.Nome +" não possui veículo cadastrado!";
            }
            else
            {
                GridViewVeiculos.DataSource = dados;
                GridViewVeiculos.DataBind();
            }

        }

        protected void btnCadastrar_Click(object sender, EventArgs e)
        {
            Veiculo veiculo = new Veiculo();

            veiculo.Marca = DropdownMarca.SelectedItem.Text;
            veiculo.Modelo = txtModelo.Text;
            veiculo.Placa = txtPlaca.Text;
            veiculo.Ano = int.Parse(txtAno.Text);
            veiculo.Motorista = motorista;

            se.AddToVeiculoes(veiculo);
            se.SaveChanges();
            Response.Redirect(Request.RawUrl);

        }
    }
}