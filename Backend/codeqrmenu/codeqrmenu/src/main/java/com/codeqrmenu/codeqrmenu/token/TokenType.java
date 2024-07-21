package com.codeqrmenu.codeqrmenu.token;

public enum TokenType {
  BEARER;

  @Override
  public String toString() {
    return name().toLowerCase();
  }
}
