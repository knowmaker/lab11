# frozen_string_literal: true

# class TranslateController
class TranslateController < ApplicationController
  def input; end

  def output
    show_database if params[:get_database] && (params[:get_database]['checked'] == '1')
    result = Result.find_by(in: params[:ch].to_i)
    check_database(result)
  end

  private

  def add_to_database(input, output)
    (Result.create in: input, out: ActiveSupport::JSON.encode(output)).save
  end

  def show_database
    @db = Result.all
    render json: @db
  end

  def calculate(in_x)
    [in_x.to_i, in_x.to_i.to_s(2), in_x.to_i.to_s(2).reverse, in_x.to_i.to_s(2).reverse.to_i(2)]
  end

  def check_database(result)
    if result
      @result_table = ActiveSupport::JSON.decode(result.out)
      @result_table
    else
      @result_table = calculate(params[:ch])
      add_to_database(params[:ch].to_i, @result_table)
    end
  end
end
