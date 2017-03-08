class Expensive < ApplicationRecord
  belongs_to :category
  belongs_to :subcategory

  filterrific(
      default_filter_params: {sorted_by: 'logdate_desc'},
      available_filters: [
          :sorted_by,
          :search_query,
          :with_category_id
      ]
  )

  scope :search_query, lambda { |query|
# Filters students whose name or email matches the query
    return nil if query.blank?

    # condition query, parse into individual keywords
    terms = query.downcase.split(/\s+/)

    # replace "*" with "%" for wildcard searches,
    # append '%', remove duplicate '%'s
    terms = terms.map { |e|
      (e.gsub('*', '%') + '%').gsub(/%+/, '%')
    }
    # configure number of OR conditions for provision
    # of interpolation arguments. Adjust this if you
    # change the number of OR conditions.
    num_or_conds = 1
    where("LOWER(expensives.note) LIKE ? ", terms)


  }
  scope :sorted_by, lambda { |sort_option|
    # Sorts students by sort_key

    # extract the sort direction from the param value.
    direction = (sort_option =~ /desc$/) ? 'desc' : 'asc'
    case sort_option.to_s
=begin
      when /^created_at_/
        order("expensives.created_at #{ direction }")
=end
      when /^logdate_/
        #when /^created_at_/
        # Simple sort on the created_at column.
        # Make sure to include the table name to avoid ambiguous column names.
        # Joining on other tables is quite common in Filterrific, and almost
        # every ActiveRecord table has a 'created_at' column.
        order("expensives.logdate #{ direction }")
      when /^amount_/
        # Simple sort on the name colums
        order("expensives.amount #{ direction }")
      when /^note_/
        # Simple sort on the name colums
        order("expensives.note #{ direction }")
      else
        raise(ArgumentError, "Invalid sort option: #{ sort_option.inspect }")
    end

  }
  scope :with_category_id, lambda { |category_ids|
    # Filters students with any of the given category_ids
    where("expensives.category_id = ?", category_ids)

  }

  # This method provides select options for the `sorted_by` filter select input.
  # It is called in the controller as part of `initialize_filterrific`.
  def self.options_for_sorted_by
    [
=begin
        ['Created (newest first)', 'created_at_asc'],
        ['Created (oldest first)', 'created_at_desc'],
=end
        ['Note (a-z)', 'note_asc'],
        ['Log date (newest first)', 'logdate_desc'],
        ['Log date (oldest first)', 'logdate_asc'],
        ['Amount (lowest)', 'amount_asc'],
        ['Amount (higest)', 'amount_desc'],
    ]
  end

=begin
  def self.options_for_select
    order('name').map { |e| [e.name, e.id] }
  end
=end

end
