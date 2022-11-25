class Request
  class << self

    def fetch(resource_path)
      response, status = get_json(resource_path)
      status == 200 ? response : errors(response)
    end

    def get(id, cache)
      response, status = get_json(id, cache)
      status == 200 ? response : errors(response)
    end

    def errors(response)
      error = { errors: { status: response["status"], message: response["message"] } }
      response.merge(error)
    end

    def get_json(path)
      response = api(path)
      [JSON.parse(response.body), response.code.to_i]
    end

    def api(path)
      Connection.api(path)
    end
  end
end
