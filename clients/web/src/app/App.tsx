import { useEffect, useState } from "react";
import apiClient from "../api/apiClient";
import type { ApiPingResponse } from "../types/api";

function App() {
  const [data, setData] = useState<ApiPingResponse | null>(null);
  const [error, setError] = useState<string | null>(null);
  const [loading, setLoading] = useState<boolean>(true);

  useEffect(() => {
    apiClient
      .get<ApiPingResponse>("/ping")
      .then((response) => {
        setData(response.data);
        setError(null);
      })
      .catch((error) => {
        console.error("API error: ", error);
        setError("Ошибка подключения к бекенду");
      })
      .finally(() => {
        setLoading(false);
      });
  }, []);

  return (
    <>
      <h1>Проверка подключения бекенда</h1>

      {loading && <p>Загрузка...</p>}

      {error && <p>Ошибка: {error}</p>}

      {data && (
        <div>
          <p>
            Ответ: <strong>{data.message}</strong>
          </p>
          <p>
            Статус: <strong>{data.status}</strong>
          </p>
        </div>
      )}
    </>
  );
}

export default App;
