﻿using System;
using FisiksAppWeb.Util;

namespace FisiksAppWeb.Entities
{
    public class PacienteOsDto : DtoBase
    {
        public int OspId { get; set; }
        public int OspPaeId { get; set; }
        public int OspOsoId { get; set; }
        public Int64 OspNroSocio { get; set; }

        public PacienteOsDto()
        {
            OspId = IntNullValue;
            OspPaeId = IntNullValue;
            OspOsoId = IntNullValue;
            OspNroSocio = IntNullValue;
            IsNew = true;
        }

        public PacienteOsDto(int ospOsoId, long ospNroSocio)
        {
            OspOsoId = ospOsoId;
            OspNroSocio = ospNroSocio;
            IsNew = true;
        }

        public PacienteOsDto(int ospId, int ospPaeId, int ospOsoId, Int64 ospNroSocio)
        {
            this.OspId = ospId;
            this.OspPaeId = ospPaeId;
            this.OspOsoId = ospOsoId;
            this.OspNroSocio = ospNroSocio;
            IsNew = true;
        }
    }
}

