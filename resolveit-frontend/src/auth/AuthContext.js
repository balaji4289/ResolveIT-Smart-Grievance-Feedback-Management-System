import { createContext, useContext, useEffect, useState } from "react";
import { jwtDecode } from "jwt-decode";

const AuthContext = createContext();

export const AuthProvider = ({ children }) => {
  const [token, setToken] = useState(localStorage.getItem("token"));
  const [user, setUser] = useState(null);
  const [roles, setRoles] = useState([]);

  useEffect(() => {
    if (token) {
      decodeToken(token);
    }
  }, [token]);

  const decodeToken = (jwt) => {
    try {
      const decoded = jwtDecode(jwt);

      setUser(decoded.sub);

      // 🔴 HANDLE ALL ROLE FORMATS
      let extractedRoles = [];

      if (decoded.roles) {
        extractedRoles = decoded.roles;
      } else if (decoded.role) {
        extractedRoles = [decoded.role];
      } else if (decoded.authorities) {
        extractedRoles = decoded.authorities.map(r => r.authority);
      }

      // Normalize roles
      extractedRoles = extractedRoles.map(r =>
        r.startsWith("ROLE_") ? r : `ROLE_${r}`
      );

      setRoles(extractedRoles);
    } catch (err) {
      console.error("Invalid token");
      logout();
    }
  };

  const login = (jwt) => {
    localStorage.setItem("token", jwt);
    setToken(jwt);
    decodeToken(jwt);
  };

  const logout = () => {
    localStorage.removeItem("token");
    setToken(null);
    setUser(null);
    setRoles([]);
  };

  const isAuthenticated = !!token;
  const isAdmin = roles.includes("ROLE_ADMIN");
  const isUser = roles.includes("ROLE_USER");

  return (
    <AuthContext.Provider
      value={{
        token,
        user,
        roles,
        isAuthenticated,
        isAdmin,
        isUser,
        login,
        logout,
      }}
    >
      {children}
    </AuthContext.Provider>
  );
};

export const useAuth = () => useContext(AuthContext);
