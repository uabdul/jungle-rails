class Notifier < ApplicationMailer
	default from: 'no-reply@jungle.com'

	def order_receipt(user, order)
		@user = user
		@order = order
		mail(to: @user.email,
			subject: "Jungle - Order Receipt No. #{@order.id}")
	end

end
