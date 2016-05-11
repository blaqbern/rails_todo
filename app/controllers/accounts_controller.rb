class AccountsController < ApplicationController
  before_filter :set_account

  def show
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @account }
    end
  end

  def edit
    respond_to do |format|
      format.html # edit.html.erb
      format.json { render json: @account }
    end
  end

  def update
    respond_to do |format|
      if @account.update_attributes(params[:account])
        format.html { redirect_to @account, notice: 'Account was successfully updated.' }
        format.json { head :no_content }
      else
        error_messages = []
        @account.errors.full_messages.each do |msg|
          error_messages << msg
        end
        format.html {redirect_to edit_account_path, alert: "Unable to update account: #{error_messages.join(", ")}"}
        format.json { render json: @account.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    def set_account
      @account = current_user.account
    end
end
