module Authors
	class AccountsController < AuthorController
		
		def edit
		
		end	

		def update_info
			if current_author.update(author__info_params)
				flash[:success]= "Sucessfully changed."
			else
				flash[:danger]= current_author.errors.full_messages.join(". ").<<'.'
			end
				redirect_to authors_account_path
		end

		def change_password
			pass_submit= author_password_params
			author = current_author
			if author.valid_password?(pass_submit[:current_password])
				if author.update(
					password: pass_submit[:new_password], 
					password_confirmation: pass_submit[:new_password_confirmation]
					)
					sign_in(author, bypass: true)
					flash[:success]= "Sucessfully changed password"
				else
					flash[:danger]= author.errors.full_messages.join(". ").<<'.'

				end
			else
				flash[:danger]="Current password is wrong."

			end
			redirect_to authors_account_path
		end

		private
		
		def author__info_params
			params.require(:author).permit(:name, :email, :bio)
		end

		def author_password_params
			params.require(:author).permit(:current_password, :new_password, :new_password_confirmation)
		end


	end
end