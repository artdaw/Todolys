class UserSessionsController < ApplicationController
  def new
    @user_session = UserSession.new
  end

  def create  
     @user_session = UserSession.new(params[:user_session])  
     
      respond_to do |format|
         if @user_session.save
           format.html { redirect_to(lists_path, :notice => 'Successfully logged in.') }
           format.xml  { render :xml => @user_session, :status => :created, :location => @user_session }
         else
           format.html { render :action => "new" }
           format.xml  { render :xml => @user_session.errors, :status => :unprocessable_entity }
         end
      end
  end
  
  def destroy
     @user_session = UserSession.find(params[:id])
     @user_session.destroy

     respond_to do |format|
       format.html { redirect_to(root_url) }
       format.xml  { head :ok }
     end
  end
end
