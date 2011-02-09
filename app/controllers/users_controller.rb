class UsersController < ApplicationController
  def new
     @user = User.new  
     respond_to do |format|
       format.html
       format.xml  { render :xml => @user }
     end
  end

  def create  
     @user = User.new(params[:user])  
     
      respond_to do |format|
         if @user.save
           format.html { redirect_to(root_url, :notice => 'Registration successful.') }
           format.xml  { render :xml => @user, :status => :created, :location => @user }
         else
           format.html { render :action => "new" }
           format.xml  { render :xml => @user.errors, :status => :unprocessable_entity }
         end
      end
  end
  
  def edit  
    @user = current_user  
  end  
  
  def update
    @user = current_user

    respond_to do |format|
      if @user.update_attributes(params[:user])
        format.html { redirect_to(root_url, :notice => 'Successfully updated profile.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @user.errors, :status => :unprocessable_entity }
      end
    end
  end

end
