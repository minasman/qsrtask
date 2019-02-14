class WorkorderMailer < ApplicationMailer
    default from: "qsrtasks@gmail.com"

    def welcome_email
        @user = User.find(2)
        mail(to: @user.email, subject: 'Sample Email')
      end

    def shop_email
        @shop = params[:shop]
        mail(to: User.find(2).email, subject: 'You were shopped!!')
    end

end
