class Admin::LoansController < Admin::BaseController
  def index
    @loans = Loan.all
  end

  def new
    @loan = Loan.new
  end

  def create
    loan = Loan.new(loan_params)
    if loan.save
      flash[:notice] = "Loan saved! :)"
      redirect_to admin_loans_path
    else
      flash[:notice] = loan.errors.full_messages.join(", ")
      render :new
    end
  end

  private

  def loan_params
    params.require(:loan).permit(:title, :description, :price, :category_id)
  end
end
